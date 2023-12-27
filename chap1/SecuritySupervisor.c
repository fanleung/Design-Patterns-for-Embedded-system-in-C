static eventStatus dispatchEvent(short id) {

    eventStatus res = eventNotConsumed;
 
    switch (activeState) {
        case SecuritySupervisor_Idle: 
        { 
            if(id == Null_id) /* null triggered event? */ 
            { 
                if(retries >= 3) 
                { 
                    activeState = SecuritySupervisor_ErrorState; 
                    displayMsg("ERROR: Max retries Exceeded"); 
                    res = eventConsumed; 
                } 
                else 
                { 
                    ++retries; 
                    activeState = SecuritySupervisor_Accepting; 
                    res = eventConsumed; 
                } 
            } 
        } 
        break; 

        /* are we in the Accepting State? */ 
        case SecuritySupervisor_Accepting: 
        { 
            if(id == keypress_SecuritySupervisor_Event_id) 
            { 
                /* params struct has the data in the attribute ’key’ */ 
                /* transition 1 */ 
                if(isCANCEL(params->key)) 
                { 
                    retries = 0; 
                    displayMsg("Cancelled"); 
                    activeState = SecuritySupervisor_Idle; 
                    { 
                        /* state ROOT.Idle.(Entry) */ 
                        strcpy(pin, ""); 
                    } 
                    res = eventConsumed; 
                } 
                else 
                { 
                    /* transition 3 */ 
                    if(isDigit(params->key)) 
                    { 
                        /* transition 3 */ 
                        addKey(params->key); 
                        activeState = SecuritySupervisor_Accepting; 
                        res = eventConsumed; 
                    } 
                    else 
                    { 
                        /* transition 5 */ 
                        /* are we in the Idle state? */
                        if(isENTER(params->key)) 
                        { 
                            activeState = 
                            SecuritySupervisor_CheckingLength; 
                            res = eventConsumed; 
                        } 
                    } 
                } 
            } 
        } 
        break; 

        case SecuritySupervisor_CheckingLength: 
        { 
            if(id == Null_id) 
            {
                /* transition 10 */
                if(strlen(pin) == 4)
                
                { 
                    activeState = SecuritySupervisor_ValidatingPIN; 
                    res = eventConsumed; 
                }
                else
                {
                    { 
                    /* transition 9 */ 
                    displayMsg("ERROR: PIN wrong length"); 
                    } 
                    activeState = SecuritySupervisor_Idle; 
                    { 
                    /* state ROOT.Idle.(Entry) */ 
                    strcpy(pin, "");
                    }
                    res = eventConsumed;
                
                } 
            } 
        } 
        break; 

        case SecuritySupervisor_ValidatingPIN: 
        { 
            if(id == Null_id) 
            {
                /* transition 13 */
                if(isValid(pin))
                { 
                    { 
                        /* transition 13 */ 
                        unlockDoor(); 
                        displayMsg("Door unlocked"); 
                    }
                    activeState = SecuritySupervisor_SecurityOpen;
                    res = eventConsumed;
                }
                else 
                { 
                    { 
                        /* transition 12 */ 
                        displayMsg("ERROR:: Invalid PIN"); 
                    } 
                    activeState = SecuritySupervisor_Idle; 
                    { 
                        /* state ROOT.Idle.(Entry) */ 
                        strcpy(pin, ""); 
                    } 
                    res = eventConsumed; 
                }
            } 
        }
        break;
    
        case SecuritySupervisor_SecurityOpen:
        {
        
            if(id == keypress_SecuritySupervisor_Event_id) 
            { 
                /* params-key has the data passed with the event */ 
                /* transition 14 */ 
                if(isRESET(params->key)) 
                { 
                    { 
                        /* transition 14 */ 
                        lockDoor(); retries = 0; 
                        displayMsg("Door locked."); 
                    } 
                    activeState = SecuritySupervisor_Idle; 
                    { 
                        /* state ROOT.Idle.(Entry) */ 
                        strcpy(pin, ""); 
                    } 
                    res = eventConsumed; 
                } 
            }
        }
        break;
        
        default:
            break;
    
    }
    return res;
    
}