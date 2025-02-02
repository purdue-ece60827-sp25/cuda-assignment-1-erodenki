
#include "cudaLib.cuh"
#include <fenv.h>

inline void gpuAssert(cudaError_t code, const char *file, int line, bool abort)
{
	if (code != cudaSuccess) 
	{
		fprintf(stderr,"GPUassert: %s %s %d\n", cudaGetErrorString(code), file, line);
		if (abort) exit(code);
	}
}

__global__ 
void saxpy_gpu (float* x, float* y, float scale, int size) {
    // get current thread index, 1D
	int idx = blockIdx.x * blockDim.x + threadIdx.x;
    float mul;
    
    // check to make sure inside bounds
    if (idx < size) {
        mul = __fmul_rn(x[idx], scale);
        y[idx] = __fadd_rn(y[idx], mul);
        //y[idx] = x[idx] * scale + y[idx];
    }

    return;
}

int runGpuSaxpy(int vectorSize) {

	std::cout << "Hello GPU Saxpy!\n";

	cudaDeviceProp devprop;

    // set rounding mode
    fesetround(FE_TONEAREST);
	
	//  Check CUDA device presence
	int numDev;
	cudaGetDeviceCount(&numDev);
	if (numDev < 1) {
		std::cout << "CUDA device missing!\n";
		return -1;
    }

	cudaGetDeviceProperties(&devprop, 0);

    #ifndef DEBUG_PRINT_DISABLE 
    	printf("Device name: %s\n", devprop.name);
    	printf("Threads per warp: %d\n", devprop.warpSize);
    	printf("Max threads per block: %d\n", devprop.maxThreadsPerBlock);
    	printf("Max thread dims: %d %d %d\n", devprop.maxThreadsDim[0], devprop.maxThreadsDim[1], devprop.maxThreadsDim[2]);
    	printf("Max grid size: %d %d %d\n", devprop.maxGridSize[0], devprop.maxGridSize[1], devprop.maxGridSize[2]);
    #endif

    float *x, *y, *y_new;
    volatile float *scale_mem;
    float scale;

    // allocate space for the arrays
    x = (float *) malloc(vectorSize * sizeof(*x));
    y = (float *) malloc(vectorSize * sizeof(*y));
    y_new = (float *) malloc(vectorSize * sizeof(*y_new));
    scale_mem = (float *) malloc(sizeof(*scale_mem));

    if (x == NULL || y == NULL || y_new == NULL) {
        printf("Memory allocation failed, exiting\n");
        return -1;
    }
    
    srand(time(0));

    // generate a random float for the scale
    //scale = (float) (rand() % 100);
    //scale = (float) (rand()) / (float) (rand());
    *scale_mem = 2.1f;
    scale = *scale_mem;

    // generate random floats for the vectors
    for (int i = 0; i < vectorSize; i++) {
        // might need to change this random gen later to get a wider range
        x[i] = (float) (rand() % 100);
        y[i] = (float) (rand() % 100); 
        y_new[i] = y[i];
    }

	#ifndef DEBUG_PRINT_DISABLE 
        printf("\nScale: %3.4f\n", scale);
        printf("Vectors:\n");
        printf("x: { ");
        for (int i = 0; i < (vectorSize > 10 ? 10 : vectorSize); i++) {
           printf("%3.4f ", x[i]);
        }
        printf("...} \ny: {"); 
        for (int i = 0; i < (vectorSize > 10 ? 10 : vectorSize); i++) {
           printf("%3.4f ", y[i]);
        }
        printf("...} \n");
    #endif

    // generate block num and thread block size
    // use max size thread blocks for now
    int num_threads_per_block = devprop.maxThreadsPerBlock;
    int num_blocks = (vectorSize / num_threads_per_block) + 1;

    // allocate memory and transfer
    float *x_device, *y_device;
    gpuErrchk(cudaMalloc(&x_device, vectorSize*sizeof(float)));
    gpuErrchk(cudaMalloc(&y_device, vectorSize*sizeof(float)));

    gpuErrchk(cudaMemcpy(x_device, x, vectorSize*sizeof(float), cudaMemcpyHostToDevice));
    gpuErrchk(cudaMemcpy(y_device, y_new, vectorSize*sizeof(float), cudaMemcpyHostToDevice));

    // invoke kernel
    saxpy_gpu<<<num_blocks, num_threads_per_block>>>(x_device, y_device, scale, vectorSize);

    gpuErrchk(cudaMemcpy(y_new, y_device, vectorSize*sizeof(float), cudaMemcpyDeviceToHost));

    cudaFree(x_device);
    cudaFree(y_device);

    int error_count = verifyVector(x, y, y_new, scale, vectorSize);
    printf("%d errors found\n", error_count);

    free(x);
    free(y);
    free(y_new);

    return (0);
}

/* 
 Some helpful definitions

 generateThreadCount is the number of threads spawned initially. Each thread is responsible for sampleSize points. 
 *pSums is a pointer to an array that holds the number of 'hit' points for each thread. The length of this array is pSumSize.

 reduceThreadCount is the number of threads used to reduce the partial sums.
 *totals is a pointer to an array that holds reduced values.
 reduceSize is the number of partial sums that each reduceThreadCount reduces.

*/

__global__
void generatePoints (uint64_t * pSums, uint64_t pSumSize, uint64_t sampleSize) {
	//	Insert code here
    int idx = blockIdx.x * blockDim.x + threadIdx.x;

    curandState_t rng;
    curand_init(clock64(), idx, 0, &rng);

    if (idx < pSumSize) {
        for (int i = 0; i < sampleSize; i++) {
            // need to make sure it generates inside the bounds
            float rand_x = curand_uniform(&rng);
            float rand_y = curand_uniform(&rng);

            if (int(rand_x * rand_x + rand_y * rand_y) == 0) {
                pSums[idx]++;
            }
        }
    }
}

__global__ 
void reduceCounts (uint64_t * pSums, uint64_t * totals, uint64_t pSumSize, uint64_t reduceSize) {
	//	Insert code here
}

int runGpuMCPi (uint64_t generateThreadCount, uint64_t sampleSize, 
	uint64_t reduceThreadCount, uint64_t reduceSize) {

	//  Check CUDA device presence
	int numDev;
	cudaGetDeviceCount(&numDev);
	if (numDev < 1) {
		std::cout << "CUDA device missing!\n";
		return -1;
	}

	auto tStart = std::chrono::high_resolution_clock::now();
		
	float approxPi = estimatePi(generateThreadCount, sampleSize, 
		reduceThreadCount, reduceSize);
	
	std::cout << "Estimated Pi = " << approxPi << "\n";

	auto tEnd= std::chrono::high_resolution_clock::now();

	std::chrono::duration<double> time_span = (tEnd- tStart);
	std::cout << "It took " << time_span.count() << " seconds.";

	return 0;
}

double estimatePi(uint64_t generateThreadCount, uint64_t sampleSize, 
	uint64_t reduceThreadCount, uint64_t reduceSize) {
	
	double approxPi = 0;
    
    uint64_t *pSums, *d_pSums;

    pSums = (uint64_t *) malloc(generateThreadCount * sizeof(*pSums));

    if (pSums == NULL) {
        printf("Memory allocation failed, exiting\n");
        return -1;    
    }

    cudaMalloc(&d_pSums, generateThreadCount*sizeof(*d_pSums));

    int num_threads_per_block = 1024;
    int num_blocks = generateThreadCount / num_threads_per_block + 1;

    generatePoints<<<num_blocks, num_threads_per_block>>>(d_pSums, generateThreadCount, sampleSize);

    cudaMemcpy(pSums, d_pSums, generateThreadCount*sizeof(*pSums), cudaMemcpyDeviceToHost);
   
    uint64_t sums = 0;

    for (int i = 0; i < generateThreadCount; i++) {
        sums += pSums[i];
    } 

    approxPi = (double) sums / (double) (generateThreadCount * sampleSize) * (double) 4;

    free(pSums);
    cudaFree(d_pSums);

	return approxPi;
}
