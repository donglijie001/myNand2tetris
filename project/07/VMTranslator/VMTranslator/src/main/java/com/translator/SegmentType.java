package com.translator;

/**
 * @author donglijie <donglijie@kuaishou.com>
 * Created on 2024-07-21
 */
public enum SegmentType {
    LOCAL("local"),
    ARGUMENT("argument"),
    THIS("this"),
    THAT("that"),
    CONSTANT("constant"),
    STATIC("static"),
    TEMP("temp"),
    POINTER("pointer");
    private String name;

    SegmentType(String name) {
        this.name = name;
    }

    public String getName() {
        return name;
    }

    public static SegmentType getSegmentType(String name) {
        for (SegmentType segmentType : SegmentType.values()) {
            if (segmentType.getName().equals(name)) {
                return segmentType;
            }
        }
        return null;
    }

}
