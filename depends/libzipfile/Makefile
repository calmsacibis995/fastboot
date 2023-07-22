LOCAL_SRC_FILES:= centraldir.c zipfile.c
LOCAL_MODULE:= libzipfile.a
LOCAL_OBJ_FILES:= centraldir.o zipfile.o

TEST_SRC_FILES:= test_zipfile.c
TEST_MODULE := test_zipfile

all: libzipfile

libzipfile:
	$(CC) -c $(LOCAL_SRC_FILES) -I../../include
	$(AR) -rcvs $(LOCAL_MODULE) $(LOCAL_OBJ_FILES)

test_zipfile:
	$(CC) -o $(TEST_MODULE) $(TEST_SRC_FILES) -L. -lzipfile -lz

clean:
	rm -rf $(LOCAL_OBJ_FILES) $(TEST_MODULE) $(LOCAL_MODULE)