#include <stdio.h>
#include "calc3.h"
#include "y.tab.h"

static int lbl;

void popStack(char f[], char s[]){
  printf("\tpopl\t%%%s\n", f);
  printf("\tpopl\t%%%s\n",s);
}
int ex(nodeType *p) {
    int lbl1, lbl2;

    if (!p) return 0;
    switch(p->type) {
    case typeCon:       
        printf("\tpushl\t$%d\n", p->con.value); 
        break;
    case typeId:        
      printf("\tpushl\t%d(%%ebp)\n", -(p->id.i + 1) * 4); 
        break;
    case typeOpr:
        switch(p->opr.oper) {
        case WHILE:
            printf("L%03d:\n", lbl1 = lbl++);
	    lbl2 = lbl;
            ex(p->opr.op[0]);
            ex(p->opr.op[1]);
            printf("\tjmp\tL%03d\n", lbl1);
            printf("L%03d:\n", lbl2);
            break;
        case IF:
          lbl2 = lbl; 
	  ex(p->opr.op[0]);
            if (p->opr.nops > 2) {
                /* if else */
                ex(p->opr.op[1]);
                printf("\tjmp\tL%03d\n", lbl1 = lbl++);
                printf("L%03d:\n", lbl2);
                ex(p->opr.op[2]);
                printf("L%03d:\n", lbl1);
            } else {
                /* if */
                printf("\tjz\tL%03d\n", lbl1 = lbl++);
                ex(p->opr.op[1]);
                printf("L%03d:\n", lbl2);
            }
            break;
        case PRINT:     
            ex(p->opr.op[0]);
            printf("\tpushl\t$prnt_int\n");
            printf("\tcall\tprintf\n");
            printf("\taddl\t$8, %%esp\n");
            break;
        case '=':       
            ex(p->opr.op[1]);
            printf("\tpopl\t%d(%%ebp)\n", -(p->opr.op[0]->id.i + 1) * 4);
            break;
        case UMINUS:    
            ex(p->opr.op[0]);
	    printf("\tpopl\t%%eax\n");
            printf("\tneg\t%%eax\n");
	    printf("\tpushl\t%%eax\n");
            break;
	case FACT:
  	    ex(p->opr.op[0]);
	    printf("%s%s%s", 
            "\tcall\tfact\n",
            "\taddl\t$4,%esp\n",
            "\tpushl\t%eax\n");
	    break;
	case LNTWO:
	    ex(p->opr.op[0]);
	    printf("\ntwo\n");
	    break;
        default:
            ex(p->opr.op[0]);
            ex(p->opr.op[1]);
            switch(p->opr.oper) {
	      /*case GCD:   
	      printf("\tgcd\n"); 
	      break;*/
            case '+':   
	      popStack("ebx","eax");
	      printf("\taddl\t%%ebx, %%eax\n");
	      printf("\tpushl\t%%eax\n");
	      break;
            case '-':   
	      popStack("ebx","eax");
	      printf("\tsubl\t%%ebx, %%eax\n");
	      printf("\tpushl\t%%eax\n");
	      break;
            case '*':   
	      popStack("ebx","eax");
	      printf("\timull\t%%ebx\n");
	      printf("\tpushl\t%%eax\n");
	      break;
            case '/':   
	      popStack("ebx","eax");
	      printf("\tidivl\t%%ebx\n");
	      printf("\tpushl\t%%eax\n");
	      break;
            case '<':   printf("\tcompLT\n"); break;
            case '>':  
	      popStack("edx","eax");
	      printf("\tcmp\t%%edx,%%eax\n");
	      printf("\tjle\tL%03d\n", lbl2 = lbl++);
	      break;
            case GE:    
	      popStack("edx","eax");
	      printf("\tcmp\t%%eax, %%edx\n"); 
	      printf("\tjge\tL%03d\n", lbl2 = lbl++);
	      break;
            case LE:    printf("\tcompLE\n"); break;
            case NE:    
	      popStack("eax","ebx");
	      printf("\tcmp\t%%ebx, %%eax\n");
	      printf("\tje\tL%03d\n", lbl2 = lbl++);
	      break;
            case EQ:   
	      popStack("eax","ebx");
	      printf("\tcmp\t%%ebx, %%eax\n");
	      printf("\tjne\tL%03d\n", lbl2 = lbl++);
	      break;
            }
        }
    }
    return 0;
}
