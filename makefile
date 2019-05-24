# Multipurpose General Makefile
# Claudia Jughashvili, 2019

CC        := i686-elf-gcc
CPP       := i686-elf-g++
LD        := i686-elf-ld
AS        := nasm
AR        := i686-elf-ar
STRIP     := i686-elf-strip

INC       := inc
OBJDIR    := obj
SRCDIR    := src
OUTDIR    := output
SRC       := $(notdir $(shell find $(SRCDIR) -maxdepth 1 -name '*.asm'))
OBJ       := $(addprefix $(OBJDIR)/,$(SRC:%.asm=%.o))
HEADERS   := $(notdir $(shell find $(INC) -maxdepth 1 -name '*.h'))
             $(notdir $(shell find $(INC) -maxdepth 1 -name '*.hpp'))
OHEADERS  := $(addprefix $(OUTDIR)/include/,$(HEADERS))
OUT       := $(OUTDIR)/lib/libcj.a
FLAGS     := -felf

$(OBJDIR)/%.o : $(SRCDIR)/%.asm
	$(AS) $(FLAGS) $< -o $@
	$(STRIP) -s $@

all: $(OBJ)
	$(AR) rcs $(OUT) $(OBJ)
	cp $(addprefix $(INC)/,$(HEADERS)) $(OHEADERS)

.PHONY : clean
clean :
	rm -f $(OBJ) $(OUT) $(OHEADERS)
