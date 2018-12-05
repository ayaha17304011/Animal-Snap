package dao;

public class AnimalDaoFactory extends AbstractDaoFactory {
	public AnimalDao getDao(){
		return new AnimalDao();
	}
}