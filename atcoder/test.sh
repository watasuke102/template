#!/usr/bin/env bash

[ -z "$CC" ] && CC="g++"
[ -z "$CFLAGS" ] && CFLAGS="-Wall"
[ -z "$TARGET" ] && TARGET="main.cpp"
build="${CC} ${CFLAGS} -o a.out ${TARGET}"

menu() {
  pos=0
  while true; do
    line=0

    for item in $1; do
      [ "$line" == "$pos" ] && cursor=">" || cursor=" "
      printf "%c %d) %s\n" "${cursor}" "${line}" "${item}"
      line=$((line+1))
    done

    read -n1 -s input
    case "${input}" in
      j)
        [ $pos -ne $((line-1)) ] && pos=$((pos+1)) || pos=0
        ;;
      k)
        [ $pos -ne 0 ] && pos=$((pos-1)) || pos=$((line-1))
        ;;
      [1-9])
        pos=${input}
        break
        ;;
      " " | "")
        break
        ;;
    esac
    tput cuu "${line}"
  done
  return ${pos}
}

separator() {
  echo "----------------------------------"
}
build() {
  echo "[INFO] building..."
  ${build}
  separator
}
help() {
  cat << END
cursor can move by j or k key.
Press enter to select.

  all    clear -> build -> run
  build  ${build}
  run    exec a.out
  help   show this text
  exit   finish this script
END
}

run() {
  while true; do
    echo "[INFO] running..."
    separator
    trap -- 'kill %1 ; echo ""' SIGINT
    echo -ne "\e[?25h" 
    ./a.out
    echo -ne "\e[?25l"
    trap - SIGINT
    separator
    menu "continue rebuild clear clear+rebuild exit "
    case $? in
      0)       ;;
      1) build ;;
      2) clear ;;
      3) clear ; build ;;
      4) break ;;
    esac
  done
}

main() {
  clear
  cat << END
  ---------------------------------
    Program test tool for AtCoder  
    V1.1.0 - 2020-2021 Watasuke    
  ---------------------------------
END

  while true; do
    menu "all clear build run help exit"
    case $? in
      0) clear; build; run ;;
      1) clear ;;
      2) build ;;
      3) run   ;;
      4) help  ;;
      5) break
    esac
    echo -e "\n"
  done
}

# カーソル非表示
echo -e "\e[?25l"
trap -- 'echo -e "\e[?25h" ; trap - EXIT' EXIT

main
