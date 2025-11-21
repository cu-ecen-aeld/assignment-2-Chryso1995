# Compiler and Flags
ifeq ($(CROSS_COMPILE),)
CC = cc
else
CC = $(CROSS_COMPILE)gcc
endif
CFLAGS := -Wall -Wextra -g

# Target Application
TARGET := writer
SRC := writer.c
OBJ := $(SRC:.c=.o)

# Default target builds the writer application
all: $(TARGET)

# Link the application
$(TARGET): $(OBJ)
	$(CC) $(CFLAGS) -o $(TARGET) $(OBJ)

# Compile source files to object files
%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

# Clean target to remove binary and object files
clean:
	rm -f $(TARGET) $(OBJ)


.PHONY: all clean

