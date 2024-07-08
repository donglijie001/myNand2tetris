package com.assembler;

import java.util.HashMap;
import java.util.Map;

/**
 * @author donglijie <donglijie@kuaishou.com>
 * Created on 2024-06-23
 */
public class SymbolTable {
    private Map<String, Integer> table = new HashMap<>();

    public SymbolTable() {
        this.addEntry("SP", 0);
        this.addEntry("LCL", 1);
        this.addEntry("ARG", 2);
        this.addEntry("THIS", 3);
        this.addEntry("THAT", 4);
        for (int i = 0; i < 16; i++) {
            this.addEntry("R"+i, i);
        }
        this.addEntry("SCREEN", 16384);
        this.addEntry("KBD", 24576);
    }

    public void addEntry(String symbol, int address) {
        // 将标签加到符号表里。
        table.put(symbol, address);
    }

    public boolean contains(String symbol) {
        return table.containsKey(symbol);
    }

    public int getAddress(String symbol) {
        if (contains(symbol)) {
            return this.table.get(symbol);
        }
        return -1;
    }
}
