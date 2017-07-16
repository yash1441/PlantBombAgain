#include <sdkhooks>
public OnEntityCreated(entity, const String:classname[])
{
    if(StrEqual(classname, "func_bomb_target", false))
    {
        SDKHookEx(entity, SDKHook_TouchPost, TouchPost);
    }
}

public TouchPost(entity, other)
{
    if(other > 0 && other <= MaxClients)
    {
        //PrintToServer("entity %i, other %i", entity, other);
        SetEntProp(other, Prop_Send, "m_bInBombZone", 1);
    }
}
