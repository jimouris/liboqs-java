LIBRARY := liboqs-jni.so
OBJFILES := oqs_KEMs.o
JAVA_INCLUDES := -I$(JAVA_HOME)/include -I$(JAVA_HOME)/include/linux
# OQS_INCLUDES := -I$(LIBOQS_HOME)include  -L$(LIBOQS_HOME) -L$(LIBOQS_HOME)/.libs

all: SimpleTest

SimpleTest: $(LIBRARY)
	javac SimpleTest.java

$(LIBRARY): $(OBJFILES)
	gcc -shared -o $@ $^ -loqs 

oqs_KEMs.o: oqs_KEMs.c oqs_KEMs.h
	gcc -fPIC -c oqs_KEMs.c $(JAVA_INCLUDES)

run:
	java -classpath . SimpleTest

clean:
	$(RM) *.o *.so *.class oqs/*.class
