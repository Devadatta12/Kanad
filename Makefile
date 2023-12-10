uname_s := $(shell uname -s)
INCLUDE =
LINKER =
STANDARD =
ifeq ($(uname_s),Darwin)
	INCLUDE = -I./include
	LINKER =
	STANDARD = -std=c++17
else ifeq ($(uname_s),Linux)
	INCLUDE = -I/usr/include -I./include
	LINKER = -L/usr/lib/aarch64-linux-gnu -pthread
	STANDARD = -std=c++17
endif

all: ./Build/Qubit.o
	g++ ./Build/Qubit.o -o Kanad $(LINKER) -lzmq -lsfml-graphics -lsfml-window -lsfml-system
	chmod +x ./Kanad


./Build/Qubit.o: ./Engine/Qubit.cpp
	g++ $(STANDARD) -c ./Engine/Qubit.cpp -o ./Build/Qubit.o $(INCLUDE)

clean:
	rm -rf ./Build/* ./Kanad