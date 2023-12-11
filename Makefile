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

all: Core
	g++ ./Build/Qubit.o ./Build/Kanad.o -o Kanad $(LINKER)
	chmod +x ./Kanad

Core: ./Engine/Qubit.cpp ./Engine/Kanad.cpp
	g++ $(STANDARD) -c ./Engine/Qubit.cpp -o ./Build/Qubit.o $(INCLUDE)
	g++ $(STANDARD) -c ./Engine/Kanad.cpp -o ./Build/Kanad.o $(INCLUDE)

clean:
	rm -rf ./Build/* ./Kanad