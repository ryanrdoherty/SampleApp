package sampleapp.db;

import java.util.Arrays;
import java.util.List;

import sampleapp.db.entities.Person;

import edu.upenn.bbl.common.jpa.DdlScriptCreator;

/**
 * SQL Creator for Tables according to JPA/Hibernate annotations.
 */
public class ScriptCreator {

    public static void main(String[] args) {
        List<Class<?>> entityList = Arrays.asList(new Class<?>[] { Person.class });
        DdlScriptCreator scripter = new DdlScriptCreator(entityList);
        System.out.println(scripter.createTablesScript());
    }
}

