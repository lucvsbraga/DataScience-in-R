# Express�es Regulares

# grep(pattern, x, ignore.case = FALSE, perl = FALSE, value = FALSE, fixed = FALSE, useBytes = FALSE, invert = FALSE)
# grepl(pattern, x, ignore.case = FALSE, perl = FALSE, fixed = FALSE, useBytes = FALSE)
# sub(pattern, replacement, x, ignore.case = FALSE, perl = FALSE, fixed = FALSE, useBytes = FALSE)
# gsub(pattern, replacement, x, ignore.case = FALSE, perl = FALSE, fixed = FALSE, useBytes = FALSE)
# regexpr(pattern, text, ignore.case = FALSE, perl = FALSE, fixed = FALSE, useBytes = FALSE)
# gregexpr(pattern, text, ignore.case = FALSE, perl = FALSE, fixed = FALSE, useBytes = FALSE)

str <- c("Express�es", "regulares", "em linguagem R",
         "permite a busca de padr�es", "e explora��o de textos",
         "podemos buscar padr�es em d�gitos", "como por exemplo",
         "10992451280")
length(str)
str

# grep()
grep("ex", str, value = F)
grep("ex", str, value = T)
grep("\\d", str, value = F)
grep("\\d", str, value = T)

# grepl()
grepl("\\d+", str)
grepl("\\D", str)

# gsub
gsub("em", "|", str)
gsub("ex", "EX", str, ignore.case = T)

# sub()
sub("em", "EM", str)

# regexpr()
frase <- "Isso � uma string."
regexpr(pattern = "u", frase)

#gregexpr()
gregexpr(pattern = "u", frase)


str2 <- c("2678 � maior que 45 - @???!/?$",
          "Vamos escrever 14 scripts R")
str2

# gsub()
gsub("\\d", "", str2)
gsub("\\D", "", str2)
gsub("\\s", "", str2)
gsub("[iot]", "Q", str2)
gsub("[[:punct:]]", "", str2)
gsub("[^@]", "", str2)
