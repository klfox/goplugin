To execute the cross-version test for Go plugins, run the following shell script:

    ./plugin-test.sh <lower Go version> <higher Go version>

This will build and run multiple docker images: two to build the code with different versions of Go and one to execute
different combinations of the client and plugin binaries.
