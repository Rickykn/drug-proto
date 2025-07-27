# Directories
PROTO_DIR = proto
THIRDPARTY_DIR = $(PROTO_DIR)/3rdparty
OUT_DIR = .

# All .proto files excluding 3rdparty folder
PROTO_FILES := $(shell find $(PROTO_DIR) -name '*.proto' ! -path "$(THIRDPARTY_DIR)/*")

# Generate all
.PHONY: gen-go
gen-go:
	protoc \
		-I=$(PROTO_DIR) \
		-I=$(THIRDPARTY_DIR) \
		--go_out=$(OUT_DIR) \
		--go-grpc_out=$(OUT_DIR) \
		--grpc-gateway_out=$(OUT_DIR) \
		$(PROTO_FILES)

.PHONY: clean
clean:
	find . -name "*.pb.go" -delete
