#include "queue.h"
#include <stdio.h>
#include <stdlib.h>

void Queue_init(Queue* const me,
                int(*isFullfunction)(Queue* const me),
                int(*isEmptyfunction)(Queue* const me),
                int(*getSizefunction)(Queue* const me),
                void(*insertfunction)(Queue* const me, int k),
                int(*removefuntion)(Queue* const me)
                )
{
    /* 初始化变量 */
    me->head = 0;
    me->tail = 0;
    me->size = 0;
    
    /* 初始化函数指针 */
    me->is_full = isFullfunction;
    me->is_empty = isEmptyfunction;
    me->get_size = getSizefunction;
    me->insert = insertfunction;
    me->remove = removefuntion;

}

void Queue_cleanup(Queue* const me)
{

}


int Queue_is_full(Queue* const me)
{
    return ((me->head + 1) % QUEUE_SIZE == me->tail);
}

int Queue_is_empty(Queue* const me)
{
    return (me->head == me->tail);    
}

int Queue_get_size(Queue* const me)
{
    return me->size;
}

/**
 * @brief 头部插入
 * @param  me      队列
 * @param  k       插入数据     
 */
void Queue_insert(Queue* const me, int k)
{
    if(!me->is_full(me)) {
        me->buffer[me->head] = k;
        me->head = (me->head + 1) % QUEUE_SIZE;
        me->size += 1;
    }
}

/**
 * @brief 尾部删除
 * @param  me               
 * @return int 
 */
int Queue_remove(Queue* const me)
{
    int value = -9999;
    if(!me->is_empty(me)) {
        value = me->buffer[me->tail];
        me->tail = (me->tail + 1) % QUEUE_SIZE;
        me->size -= 1;
    }
    return value;
}

Queue *Queue_create(void)
{
    Queue *me = (Queue *)malloc(sizeof(Queue));
    if(me != NULL) {
        Queue_init(me, 
        Queue_is_full, 
        Queue_is_empty, 
        Queue_get_size, 
        Queue_insert, 
        Queue_remove
        );
    }
    return me;
}

void Queue_destroy(Queue* const me)
{
    if(me != NULL) {
        Queue_cleanup(me);
    }
    free(me);
}