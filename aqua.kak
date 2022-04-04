hook global BufCreate .*\.aqua %{
    set-option buffer filetype aqua
}

hook global WinSetOption filetype=aqua %{
    require-module aqua
}

hook -group aqua-highlight global WinSetOption filetype=aqua %{
    add-highlighter window/aqua ref aqua
}

provide-module aqua %{

add-highlighter shared/aqua regions
add-highlighter shared/aqua/code default-region group

# comments
add-highlighter shared/aqua/comment region -- $ fill comment

# literals
add-highlighter shared/aqua/string  region (?<!'\\)(?<!')" (?<!\\)(\\\\)*"  fill string
add-highlighter shared/aqua/code/numbers regex \b\d+\b 0:value

# types
add-highlighter shared/aqua/code/types regex \b(string|bool|u8|u16|u32|u64|i8|i16|i32|i64|f32|f64)\b 0:attribute
add-highlighter shared/aqua/code/data_types regex \b[A-Z]\w*\b 0:type

# operators
add-highlighter shared/aqua/code/operators regex (<-|<<-|->|\?=|=|\?|\[\]|==) 0:operator

# keywords
add-highlighter shared/aqua/code/control_flow regex \b(try|catch|par|if|else|otherwise|for|co|join)\b 0:keyword
add-highlighter shared/aqua/code/topology regex \b(on|via|use|func|service|data|alias|const)\b 1:keyword
add-highlighter shared/aqua/code/import regex \b(import|export|module|declares|from|as)\b 1:keyword

# function declaraions
add-highlighter shared/aqua/code/func_decl regex (?:func\h+)(\w+)\( 1:function
}
