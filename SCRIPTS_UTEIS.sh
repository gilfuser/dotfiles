# renomeia todos os arquivos com um certo nome nas subpastas
for x in $(find . -name \README.md); do                                    1 ↵ ✖ ✹ ✭
  mv $x $(echo "$x" | sed 's/\README.md$/index.md/')
done

