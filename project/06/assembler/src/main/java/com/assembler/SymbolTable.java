package com.assembler;

import java.util.HashMap;
import java.util.Map;

/**
 * @author donglijie <donglijie@kuaishou.com>
 * Created on 2024-06-23
 */
public class SymbolTable {
    private Map<String, Integer> symbolTableMap = new HashMap<>();

    public SymbolTable() {
    }

    public void addEntry(String symbol, int address) {
        // 将标签加到符号表里。
        symbolTableMap.put(symbol, address);
    }

    public boolean contains(String symbol) {
        return symbolTableMap.containsKey(symbol);
    }

    public int getAddress(String symbol) {
        return symbolTableMap.get(symbol);
    }
}
