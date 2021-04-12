#include <stdio.h>
#include <string.h>
#include <stdlib.h>

extern assFunc(int x);

char c_checkValidity(int x){
    if(x%2==0)
        return (char)1;
    return (char)0;
}

int main(){
    char number[4];
    scanf("%s",number);
    int a=atoi(number);
    
    assFunc(a);
    return 0;
}