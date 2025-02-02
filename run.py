import os
import subprocess

RESULTS_LOC = "results/"
PARAM_NAME = "VECTOR_SIZE"
PARAM_FILE_NAME = "lab1.cuh"
LAB_SHELL_ARG = "2"

#param_vals = ["1e0", "1e1", "1e2", "1e3", "1e4", "1e5", "1e6", "1e7", "1e8"]
param_vals = ["1<<0", "1<<5", "1<<10", "1<<15", "1<<20", "1<<25", "1<<30"]


for new_param in param_vals:
    # open header for reading and writing
    with open(PARAM_FILE_NAME, 'r') as file:
        filetext = file.read()

    # find the location of the parameter
    param_loc = filetext.find(PARAM_NAME)

    #quit if parameter not found
    if (param_loc == -1):
        print("Failed to find %s in %s... Quitting" %(PARAM_NAME, PARAM_FILE_NAME))
        quit()

    # get the line which containts the parameter
    file_lines = filetext.splitlines()
    line_num = filetext[0:param_loc].count('\n')
    param_line = file_lines[line_num]

    # create the new parameter line
    start_text_loc = param_line.find(PARAM_NAME)
    first_space = param_line[start_text_loc:].expandtabs(1).find(' ')
    if (first_space == -1):
        print("Failed to find end of param string in %s... Quitting" %(PARAM_FILE_NAME))
        quit()
    end_text_loc = start_text_loc + first_space
    new_param_line = param_line[0:end_text_loc] + "\t\t" + str(new_param)
    file_lines[line_num] = new_param_line

    # write back to file
    with open(PARAM_FILE_NAME, 'w') as file:
        for line in file_lines:
            file.write("%s\n" % (line))

    # make lab1
    res = subprocess.call(["make"])
    if (res == 1):
        print("Failed to run make... Quitting")
        quit()

    # run the nvprof + lab1 shell
    p = subprocess.Popen(["nvprof", "--csv", "--log-file", "results.txt",  "./lab1"], stdin=subprocess.PIPE, text=True)

    #give the subprocess input
    outs, errs = p.communicate(input=LAB_SHELL_ARG)

    # check if child kill
    p.poll()
    if (p.returncode == None):
        print("child is not kil.")
    else:
        print("\nProgram is terminated, saving to CSV...\n")

    # parse the results file and save as csv
    with open("results.txt", 'r') as file:
        file_lines = file.read().splitlines()

    # save to csv without first 3 lines
    with open(RESULTS_LOC + PARAM_NAME + "_" + str(new_param) + ".csv", 'w') as file:
        for line in file_lines[3:]:
            file.write("%s\n" % (line))


