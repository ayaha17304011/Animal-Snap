
package commands;

import main.RequestContext;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.Properties;

public abstract class CommandFactory {
	public static AbstractCommand getCommand(RequestContext rec) {
		AbstractCommand command = null;
		
		Properties prop = new Properties();
		
		try{
			prop.load(CommandFactory.class.getClassLoader().getResourceAsStream("../../properties/commands.properties"));
			
			String name = prop.getProperty(rec.getCommandPath());
			
			Class c = Class.forName(name);
			
			command = (AbstractCommand) c.newInstance();
			
		} catch(FileNotFoundException e) {
			throw new  RuntimeException(e.getMessage(), e);
		} catch(IOException e) {
			throw new  RuntimeException(e.getMessage(), e);
		} catch(ClassNotFoundException e) {
			throw new  RuntimeException(e.getMessage(), e);
		} catch(InstantiationException e) {
			throw new  RuntimeException(e.getMessage(), e);
		} catch(IllegalAccessException e) {
			throw new  RuntimeException(e.getMessage(), e);
		}
	return command;
	}