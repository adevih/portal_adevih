// Decompiled by DJ v3.7.7.81 Copyright 2004 Atanas Neshkov  Date: 17/05/2022 14:29:04
// Home Page : http://members.fortunecity.com/neshkov/dj.html  - Check often for new version!
// Decompiler options: packimports(3) 
// Source File Name:   CADFranquia.java

package com.infinity.cad;

import com.flexnet.utl.*;
import java.util.ArrayList;
import java.util.List;

public class CADFranquia
{

    public CADFranquia()
    {
        load();
    }

    public long getId()
    {
        if(listaCodigo == null || intLido < 0)
            return 0L;
        else
            return Long.parseLong(((UTLRecord)listaCodigo.get(intLido)).getCampos()[0]);
    }

    public String getCodigo()
    {
        if(listaCodigo == null || intLido < 0)
            return "";
        else
            return ((UTLRecord)listaCodigo.get(intLido)).getCampos()[0];
    }

    public String getTitulo()
    {
        if(listaCodigo == null || intLido < 0)
            return null;
        else
            return ((UTLRecord)listaCodigo.get(intLido)).getCampos()[1];
    }

    public boolean isFind(long lCodigo)
    {
        boolean bRet = false;
        start();
        while(next()) 
            if(getId() == lCodigo)
            {
                bRet = true;
                break;
            }
        return bRet;
    }

    public String getTitulo(int iCampo)
    {
        String _ret = "";
        start();
        while(next()) 
            if(Integer.parseInt(((UTLRecord)listaCodigo.get(intLido)).getCampos()[0]) == iCampo)
            {
                _ret = getTitulo();
                break;
            }
        return _ret;
    }

    public UTLCombo getCombo()
    {
        UTLCombo _combo = new UTLCombo();
        _combo.add(0, "--selecione--");
        start();
        for(; next(); _combo.add(getCodigo(), getTitulo()));
        return _combo;
    }

    public int getRegistroLido()
    {
        return intLido;
    }

    public int getRegistrosLidos()
    {
        if(listaCodigo == null)
            return 0;
        else
            return listaCodigo.size();
    }

    public boolean next()
    {
        if(listaCodigo == null || intLido + 1 == listaCodigo.size())
        {
            return false;
        } else
        {
            intLido++;
            return true;
        }
    }

    public boolean previous()
    {
        if(listaCodigo == null || intLido <= 0)
        {
            return false;
        } else
        {
            intLido--;
            return true;
        }
    }

    public void start()
    {
        intLido = -1;
    }

    private void load()
    {
        intLido = -1;
        try
        {
            UTLLoadList lista = new UTLLoadList(getClass(), getClass().getSimpleName(), 1);
            listaCodigo = lista.getLista();
        }
        catch(Exception e)
        {
            listaCodigo = new ArrayList();
        }
    }

    private List listaCodigo;
    private int intLido;
}