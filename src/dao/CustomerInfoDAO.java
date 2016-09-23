package dao;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.criterion.Restrictions;

import beans.CustomerInfo;



public class CustomerInfoDAO {
	public ArrayList<CustomerInfo> addcustomer(CustomerInfo customerinfo)
	{
		Session session = null;
		try 
		{
			Transaction transaction = null;
			// This step will read hibernate.cfg.xml and prepare hibernate for
			// use
			SessionFactory sessionFactory = new Configuration().configure()
					.buildSessionFactory();
			session = sessionFactory.openSession();
			//Criteria Query Example
			transaction = session.beginTransaction();
			session.save(customerinfo);
			transaction.commit();
		} catch (Exception e){
			System.out.println(e.getMessage());
		} finally {
			session.flush();
			session.close();
			
		}	
		
		return selectallcustomers();
	}
		
		public ArrayList<CustomerInfo> selectallcustomers()
		{
			Session session = null;
			CustomerInfo Customerinfo= new CustomerInfo();
			ArrayList<CustomerInfo> customers= new ArrayList<CustomerInfo>();
			try 
			{
				// This step will read hibernate.cfg.xml and prepare hibernate for
				// use
				SessionFactory sessionFactory = new Configuration().configure()
						.buildSessionFactory();
				session = sessionFactory.openSession();
				//Criteria Query Example
				
				Criteria crit = session.createCriteria(CustomerInfo.class);
				crit.setMaxResults(100); //Restricts the max rows to 5
				
				//List<Employee> list=session.createCriteria(Employee.class).list();
				List<CustomerInfo> list=crit.list();
				for(int i=0;i<list.size();i++)
				{
				Customerinfo=list.get(i);
				customers.add(Customerinfo);
				}
				session.close();
			} catch (Exception e){
				System.out.println(e.getMessage());
			} finally {
				session.flush();
			session.close();
			}	
			return customers;
		}
	public CustomerInfo getInfo(String username)
	{
		Session session = null;
		CustomerInfo Customerinfo= new CustomerInfo();
		try 
		{
			// This step will read hibernate.cfg.xml and prepare hibernate for
			// use
			SessionFactory sessionFactory = new Configuration().configure()
					.buildSessionFactory();
			session = sessionFactory.openSession();
			//Criteria Query Example
			
			Criteria crit = session.createCriteria(CustomerInfo.class);
			crit.add(Restrictions.like("username",username));
			crit.setMaxResults(20); //Restricts the max rows to 5
			
			//List<Employee> list=session.createCriteria(Employee.class).list();
			List<CustomerInfo> list=crit.list();
			for(int i=0;i<list.size();i++)
			{
			Customerinfo=list.get(i);
			System.out.println(Customerinfo.getUsername()+" "+Customerinfo.getBalance());
			}
			session.close();
		} catch (Exception e){
			System.out.println(e.getMessage());
		} finally {
			session.flush();
			session.close();
		}	
		return Customerinfo;
	}
	public String getName(int accno)
	{
		Session session = null;
		CustomerInfo b=new CustomerInfo();
		try 
		{
			// This step will read hibernate.cfg.xml and prepare hibernate for
			// use
			SessionFactory sessionFactory = new Configuration().configure()
					.buildSessionFactory();
			session = sessionFactory.openSession();
			//Criteria Query Example
			Criteria crit = session.createCriteria(CustomerInfo.class);
			crit.add(Restrictions.like("accno", accno));
			crit.setMaxResults(20); //Restricts the max rows to 5
			
			//List<Employee> list=session.createCriteria(Employee.class).list();
			List<CustomerInfo> list=crit.list();
			for(int i=0;i<list.size();i++)
			{
				 b=list.get(i);	
			}
			session.close();
		} catch (Exception e){
			System.out.println(e.getMessage());
		} finally {
			session.flush();
		session.close();
		}	
		String name= b.getUsername();
		return name;
	}
	public CustomerInfo deposit(int accno, double depositamount)
	{
		
		if(depositamount < 0)
		{
			CustomerInfo empty=new CustomerInfo();
			return empty;
		}
		
		return depositwithdraw(accno, depositamount);
	}
	
	public CustomerInfo withdraw(int accno, double withdrawamount)
		{
			if(withdrawamount < 0)
			{
				CustomerInfo empty=new CustomerInfo();
				return empty;
			}
		return depositwithdraw(accno, -1*withdrawamount);
		}
	
		private CustomerInfo depositwithdraw(int accno, double depositamount)
		{
			Session session = null;
			Transaction transaction= null; 
			CustomerInfo b=new CustomerInfo();
			
			try 
			{
				// This step will read hibernate.cfg.xml and prepare hibernate for
				// use
				SessionFactory sessionFactory = new Configuration().configure()
						.buildSessionFactory();
				session = sessionFactory.openSession();
				//Criteria Query Example
				Criteria crit = session.createCriteria(CustomerInfo.class);
				crit.add(Restrictions.like("accno", accno));
				//crit.setMaxResults(20); //Restricts the max rows to 5
				//List<Employee> list=session.createCriteria(Employee.class).list();
				List<CustomerInfo> list=crit.list();
				transaction=session.beginTransaction();
				for(int i=0;i<list.size();i++)
				{
					
					
					b=list.get(i);
					double bal=Double.parseDouble(b.getBalance());
					double newbal=bal+depositamount;
					b.setBalance(newbal+"");
					session.update(b);		
				}
				transaction.commit();
				session.flush();
				session.close();
			} catch (Exception e) {
				System.out.println(e.getMessage());
			} finally {
				session.flush();
				session.close();
			}
			CustomerInfo newc= new CustomerInfo();
			 newc=getInfo(b.getUsername());
			return newc;
		}
public void LastVisitedDateupdate(String username)
		{
			Session session = null;
			Transaction transaction= null; 
			CustomerInfo b=new CustomerInfo();
			
			try 
			{
				// This step will read hibernate.cfg.xml and prepare hibernate for
				// use
				SessionFactory sessionFactory = new Configuration().configure()
						.buildSessionFactory();
				session = sessionFactory.openSession();
				//Criteria Query Example
				Criteria crit = session.createCriteria(CustomerInfo.class);
				crit.add(Restrictions.like("username", username));
				//crit.setMaxResults(20); //Restricts the max rows to 5
				//List<Employee> list=session.createCriteria(Employee.class).list();
				List<CustomerInfo> list=crit.list();
				transaction=session.beginTransaction();
				for(int i=0;i<list.size();i++)
				{	
					b=list.get(i);
					SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm");
					Date date = new Date();
					java.sql.Date dat= new java.sql.Date(date.getTime());;
					System.out.println(sdf.format(date));
					b.setLastvisiteddate(dat);
					session.update(b);		
				}
				transaction.commit();
				session.flush();
				session.close();
			} catch (Exception e) {
				System.out.println(e.getMessage());
			} finally {
				session.flush();
				session.close();
			}
		}
		public CustomerInfo transferamount(int fromaccno1,int toaccno2,double transferamount)
		{
			CustomerInfo c=withdraw(fromaccno1, transferamount);
			deposit(toaccno2, transferamount);
			
			
		return c;
		}
}
