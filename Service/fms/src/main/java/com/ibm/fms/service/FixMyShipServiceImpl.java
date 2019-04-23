package com.ibm.fms.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import com.ibm.fms.dao.FixMyShipDAO;
import com.ibm.fms.dao.FixMyShipLikeDAO;
import com.ibm.fms.dao.FixMyShipTagDAO;
import com.ibm.fms.model.Like;
import com.ibm.fms.model.Post;
import com.ibm.fms.model.Tag;

@Service
public class FixMyShipServiceImpl implements FixMyShipService {
	
	@Autowired
	private FixMyShipDAO fmsDAO;
	@Autowired
	private FixMyShipLikeDAO fmsLikeDAO;
	@Autowired
	private FixMyShipTagDAO fmsTagDAO;
	@PersistenceContext
	EntityManager entityManager;

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
	public boolean deletePost(int pId) {
		fmsDAO.delete(fmsDAO.findById(pId).get());
		return true;
	}

	@Override
	public boolean updatePost(Post post) {
		fmsDAO.save(post);
		return true;
	}

	@Override
	public int addLike(Like like) {
		List<Integer> count = entityManager.createQuery("select uid from Like where cid="+like.getCid(),Integer.class).getResultList();
		if(!count.contains(like.getUid()))
		{
			fmsLikeDAO.save(like);
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
	
	public synchronized List getLike()
	{
		
		List count = entityManager.createQuery("select count(*) from Like group by cid ",Long.class).getResultList();
		
		return count;
	   
	}
	@Override
	public List<Tag> getAllTags() {
		return fmsTagDAO.findAll();
	}
	
	
}
