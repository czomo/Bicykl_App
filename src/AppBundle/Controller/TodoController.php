<?php

namespace AppBundle\Controller;
use AppBundle\Entity\Todo;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\Extension\Core\Type\TextareaType;
use Symfony\Component\Form\Extension\Core\Type\DateType;
use Symfony\Component\Form\Extension\Core\Type\SubmitType;
use Symfony\Component\Form\Extension\Core\Type\DateTimeType;
class TodoController extends Controller
{
    /**
     * @Route("/home", name="home")
     */
    public function listAction(Request $request)
    {
            // replace this example code with whatever you need
        return $this->render('todo/index.html.twig');
    }
	/**
     * @Route("/todo/create", name="todo_create")
     */
    public function createAction(Request $request)
    {$todos = $this ->getDoctrine()
		->getRepository('AppBundle:Todo')
		->findALL();
        return $this->render('todo/create.html.twig',array(
		'todos'=>$todos
		));
    
    }
	/**
     * @Route("/todo/edit/{id}", name="todo_edit")
     */
    public function editAction($id,Request $request)
    {
         $todo=$this->getDoctrine()
		->getRepository('AppBundle:Todo')
		->find($id);
		$now=new\DateTime('now');
		$todo->setName($todo->getName());
			$todo->setCategory($todo->getCategory());
			$todo->setDesciption($todo->getDesciption());
			$todo->setPrice($todo->getPrice());
			$todo->setYear($todo->getYear());
			$todo->setAmount($todo->getAmount());
			$todo->setaddDate($now);
		
		$form=$this->createFormBuilder($todo)
		->add('name',TextType::class,array('attr'=>array('class'=>'form-control','style'=>'margin-bottom:15px')))
		->add('category',TextType::class,array('attr'=>array('class'=>'form-control','style'=>'margin-bottom:15px')))
		->add('desciption',TextareaType::class,array('attr'=>array('class'=>'form-control','style'=>'margin-bottom:15px')))
		->add('price',TextType::class,array('attr'=>array('class'=>'form-control','style'=>'margin-bottom:15px')))
		->add('year',DateType::class,array('attr'=>array('class'=>'form-control','style'=>'margin-bottom:15px')))
		->add('amount',TextType::class,array('attr'=>array('class'=>'form-control','style'=>'margin-bottom:15px')))
        ->add('save',SubmitType::class,array('label'=>'Zapisz','attr'=>array('class'=>'btn btn-primary','style'=>'margin-bottom:15px')))
		->getForm();
		
		$form->handleRequest($request);
		if($form->isSubmitted() && $form->isValid()){
			$name=$form['name']->getData();
			$category=$form['category']->getData();
			$desciption=$form['desciption']->getData();
			$price=$form['price']->getData();
			$year=$form['year']->getData();
			$amount=$form['amount']->getData();
			$now=new\DateTime('now');
			
			$em=$this->getDoctrine()->getManager();
			$todo=$em->getRepository('AppBundle:Todo')->find($id);
			
			$todo->setName($name);
			$todo->setCategory($category);
			$todo->setDesciption($desciption);
			$todo->setPrice($price);
			$todo->setYear($year);
			$todo->setAmount($amount);
			$todo->setaddDate($now);
			
			
			$em->flush();
            $this->addFlash(
			'notice','Uaktualniono'
			);
			return $this->redirectToRoute('todo_create');
		}   
		
        return $this->render('todo/edit.html.twig',array(
		'todo'=>$todo,
		'form'=>$form->createView()
		));
    }
	/**
     * @Route("/todo/details/{id}", name="todo_details")
     */
    public function detailsAction($id)
    {
        $todo=$this->getDoctrine()
		->getRepository('AppBundle:Todo')
		->find($id);
		
        return $this->render('todo/details.html.twig',array(
		'todo'=>$todo));
    }
	/**
     * @Route("/todo/contact", name="todo_contact")
     */
    public function contactAction(Request $request)
    {
        // replace this example code with whatever you need
        return $this->render('todo/contact.html.twig');
    }
	/**
     * @Route("/todo/make", name="todo_make")
     */
    public function makeAction(Request $request)
    {
		$todo =new Todo;
		$form=$this->createFormBuilder($todo)
		->add('name',TextType::class,array('attr'=>array('class'=>'form-control','style'=>'margin-bottom:15px')))
		->add('category',TextType::class,array('attr'=>array('class'=>'form-control','style'=>'margin-bottom:15px')))
		->add('desciption',TextareaType::class,array('attr'=>array('class'=>'form-control','style'=>'margin-bottom:15px')))
		->add('price',TextType::class,array('attr'=>array('class'=>'form-control','style'=>'margin-bottom:15px')))
		->add('year',DateType::class,array('attr'=>array('class'=>'form-control','style'=>'margin-bottom:15px')))
		->add('amount',TextType::class,array('attr'=>array('class'=>'form-control','style'=>'margin-bottom:15px')))
        ->add('save',SubmitType::class,array('label'=>'Zapisz','attr'=>array('class'=>'btn btn-primary','style'=>'margin-bottom:15px')))
		->getForm();
		
		$form->handleRequest($request);
		if($form->isSubmitted() && $form->isValid()){
			$name=$form['name']->getData();
			$category=$form['category']->getData();
			$desciption=$form['desciption']->getData();
			$price=$form['price']->getData();
			$year=$form['year']->getData();
			$amount=$form['amount']->getData();
			$now=new\DateTime('now');
			
			$todo->setName($name);
			$todo->setCategory($category);
			$todo->setDesciption($desciption);
			$todo->setPrice($price);
			$todo->setYear($year);
			$todo->setAmount($amount);
			$todo->setaddDate($now);
			
			$em=$this->getDoctrine()->getManager();
			$em->persist($todo);
			$em->flush();
            $this->addFlash(
			'notice','Dodano'
			);
			return $this->redirectToRoute('todo_create');
		}   
		
		return $this->render('todo/make.html.twig',array(
		'form'=>$form->createView()));
    }
	/**
     * @Route("/todo/delete/{id}", name="todo_delete")
     */
    public function deleteAction($id)
    {
        $em=$this->getDoctrine()->getManager();
		$todo=$em->getRepository('AppBundle:Todo')->find($id);
		$em->remove($todo);
		$em->flush();
		$this->addFlash(
			'notice','Usunięto z bazy!'
			);
			return $this->redirectToRoute('todo_create');
    }
}
