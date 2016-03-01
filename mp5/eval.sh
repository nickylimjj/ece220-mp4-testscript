Gre='\033[0;32m';
Def='\033[0m';
Red='\033[0;31m';

ans=(gold_output1 gold_output2 gold_output3)
mine=(my_output1 my_output2 my_output3)

for i in {0..2}; do

    diff ${mine[i]} ./text-examples/${ans[i]}
    check=$?
    if [[ check -eq 0 ]]; then
        echo -e "Test" $((i+1))": ${Gre}Passed${Def}"
    elif [[ check -eq 1 ]]; then 
        echo -e "Test" $((i+1))": ${Red}Failed${Def}"
    elif [[ check -eq 2 ]]; then
        echo -e "${Red} Error has occurred.${Def}"
    fi
done
