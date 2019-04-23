package com.ibm.fms.service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ibm.fms.dao.FixMyShipDAO;
import com.ibm.fms.dao.FixMyShipDisLikeDAO;
import com.ibm.fms.dao.FixMyShipLikeDAO;
import com.ibm.fms.model.DisLike;
import com.ibm.fms.model.Like;
import com.ibm.fms.model.Post;
import com.ibm.fms.model.Users;

@Service
public class FixMyShipServiceImpl implements FixMyShipService {
	@PersistenceContext
	EntityManager entityManager;
	@Autowired
	private FixMyShipDAO fmsDAO;
	@Autowired
	private FixMyShipLikeDAO fmsLikeDAO;
	@Autowired
	private FixMyShipDisLikeDAO fmsDisLikeDAO;
	

	@Override
	public synchronized boolean addPost(Post post) {
		fmsDAO.save(post);
		return true;
	}

	@Override
	public List<Post> getAllPosts() {
		return fmsDAO.findAll();
	}

	@Override
	public Optional<Post> findPost(int id) {
		return fmsDAO.findById(id);
	}

	@Override
	public synchronized int addLike(Like like) {
		
		List<Integer> count = entityManager.createQuery("select uid from Like where cid="+like.getCid(),Integer.class).getResultList();
		System.out.println("Countsssss "+count);
		if(!count.contains(like.getUid()))
		{
			fmsLikeDAO.save(like);
		}
		else
		{
			List id=entityManager.createQuery("select id from Like where uid="+like.getUid()+"and cid="+like.getCid(),Integer.class).getResultList();
			System.out.println("Idssss "+id);
			fmsLikeDAO.deleteById((Integer) id.get(0));
			//entityManager.createQuery("select uid from Like where cid="+like.getCid(),Integer.class);
			//List del=entityManager.createQuery("delete from Like where uid="+like.getUid()).getResultList();
		}
		return 0;
	}
	
   	@Override
	public synchronized int addDisLike(DisLike dislike) {
		
		List<Integer> count = entityManager.createQuery("select uid from DisLike where cid="+dislike.getCid(),Integer.class).getResultList();
		System.out.println("Dislike Counts "+count);
		if(!count.contains(dislike.getUid()))
		{
			fmsDisLikeDAO.save(dislike);
			
			List id=entityManager.createQuery("select id from DisLike where uid="+dislike.getUid()+"and cid="+dislike.getCid(),Integer.class).getResultList();
			System.out.println("Dislike id "+id);
			fmsLikeDAO.deleteById((Integer) id.get(0));
		}
		else
		{
			List id=entityManager.createQuery("select id from DisLike where uid="+dislike.getUid()+"and cid="+dislike.getCid(),Integer.class).getResultList();
			System.out.println(" Dislike Ids "+id);
			fmsDisLikeDAO.deleteById((Integer) id.get(0));
			//entityManager.createQuery("select uid from Like where cid="+like.getCid(),Integer.class);
			//List del=entityManager.createQuery("delete from Like where uid="+like.getUid()).getResultList();
		}
		return 0;
	}
	
	
	public synchronized String maxLike()
	{
		
	List cid = entityManager.createQuery("select cid from Like group by cid order by count(cid) desc",Integer.class).setMaxResults(1).getResultList();
	String name = entityManager.createQuery("select u.firstname from Users u JOIN Post p on p.uid=u.id where p.id="+cid.get(0),String.class).getSingleResult();
		//int name = entityManager.createQuery("select email from Users",String.class).getMaxResults();
		System.out.println("hello its me::: "+ cid.get(0)+" and the name is: "+ name);
		return name;
		//select cid,count(uid) as count from likes group by cid order by count desc
		//select count(cid),cid from likes group by cid order by count(cid) desc
		//select cid from (select count(cid),cid from likes l group by cid order by count(cid) desc) as l limit 1
		
		//select firstName from users, posts where posts.uid=users.id and posts.id=6
	   
	}
	
	public synchronized List<Object[]> getLike()
	{
		
		List<Object[]> count = entityManager.createQuery("select count(*),cid from Like group by cid ",Object[].class).getResultList();
		//HashMap count = (HashMap) entityManager.createQuery("select count(*),cid from Like group by cid ",Object[].class).getResultStream();
		
		return count;
	   
	}
	
}
