AS  = qfasm
SRC = src
BIN = bin

all:
	@mkdir -p $(BIN)
	@echo "Compiling kernel.asm..."
	@$(AS) $(SRC)/kernel.asm $(BIN)/kernel.bin

clean:
	@echo "Deleting binaries..."
	@rm -f $(BIN)/*

