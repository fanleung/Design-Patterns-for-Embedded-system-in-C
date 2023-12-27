#include <stdio.h>
#include <stdlib.h>
#include "queue.h"

void main(void)
{
    int j, k, h, t;
    /* test normal queue */
    Queue *myQueue;
    myQueue = Queue_create();
    k = 1000;
    for(j = 0; j < QUEUE_SIZE - 1; j++) {
        h = myQueue->head;
        myQueue->insert(myQueue, k);
        printf("inserting %d at position %d, size = %d\r\n", k--, h, myQueue->get_size(myQueue));
    };
    printf("Inserted %d elements\n", myQueue->get_size(myQueue));

    for(j = 0; j < QUEUE_SIZE - 1; j++) {
        t = myQueue->tail;
        k = myQueue->remove(myQueue);
        printf("REMOVING %d at position %d, size = %d\r\n", k, t, myQueue->get_size(myQueue));
    }

    printf("Last item removed = %d\r\n", k);
    printf("Current queue size %d \r\n", myQueue->get_size(myQueue));
    
}