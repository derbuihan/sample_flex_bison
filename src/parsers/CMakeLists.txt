
include_directories(${CMAKE_CURRENT_BINARY_DIR})

# Bison
find_package(BISON REQUIRED)
set(PARSER_OUT ${CMAKE_CURRENT_BINARY_DIR}/parser.c)
set(PARSER_HEADER ${CMAKE_CURRENT_BINARY_DIR}/parser.h)
BISON_TARGET(Parser parser.y ${PARSER_OUT} DEFINES_FILE ${PARSER_HEADER})

# Flex
find_package(FLEX REQUIRED)
set(LEXER_OUT ${CMAKE_CURRENT_BINARY_DIR}/lexer.c)
set(LEXER_HEADER ${CMAKE_CURRENT_BINARY_DIR}/lexer.h)
FLEX_TARGET(Tokenizer lexer.l ${LEXER_OUT} DEFINES_FILE ${LEXER_HEADER})

add_flex_bison_dependency(Tokenizer Parser)
add_library(parser ${LEXER_OUT} ${PARSER_OUT})
