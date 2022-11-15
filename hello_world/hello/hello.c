
#include <stdio.h>
#include <stdlib.h>

int main(int argc, const char *argv[])
{
    // no dependency from vfs_entity when using stderr
    fprintf(stderr,"Hello world! I am ALIVE\n\n"); 

    return EXIT_SUCCESS;
}
