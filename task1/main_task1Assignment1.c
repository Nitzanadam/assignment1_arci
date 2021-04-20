#include <stdio.h>
#include <string.h>
#include <stdlib.h>

extern assFunc(int x);

char c_checkValidity(int x){

    char b = 0;
    if(x%2 == 0){
        b = 1;
    }
    return b;
}

int main(){
    char number[4];
    scanf("%s",number);
    int a = atoi(number);
    
    assFunc(a);
    return 0;
}