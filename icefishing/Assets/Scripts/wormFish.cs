using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using TMPro;
using UnityEngine.Audio;

public class wormFish : MonoBehaviour
{

    public bool hasFish;
    public int worms;
    public GameObject fishy;
    public GameObject fishBreak;
    private GameObject currentFish;
    public SpriteRenderer spriteRenderer;
    public SpriteRenderer spriteRenderer2;
    public Sprite newSprite;
    public Sprite newSprite2;
    public Sprite newSpriteWorm;
    public Sprite newSpriteWorm2;
    public Sprite newSpriteWorm3;
    public Sprite newSpriteWorm4;
    public scoreDisplay scoreDisplay;
    public AudioClip audio1;
    public AudioClip audio2;
    public AudioClip audio3;
    public AudioClip audio4;
    public AudioClip audio5;
    public AudioClip audio6;
    public AudioSource source;
    
    


    void Start()
    {
       hasFish = false;
       worms = 3;
       source.PlayOneShot(audio6);

    }
    
    private void OnTriggerEnter2D(Collider2D other)
    {
         if (hasFish == false && other.gameObject.CompareTag("fish"))
        {
            Destroy(other.gameObject);
            GameObject newFish = Instantiate(fishy, transform.position + new Vector3(-0.23f,-0.77f,0), Quaternion.Euler(0,0,90f), transform);
            currentFish = newFish;
            hasFish = true;
            spriteRenderer2.sprite = newSpriteWorm3;
            source.PlayOneShot(audio4);  
        }
        
        if (hasFish == true && other.gameObject.CompareTag("catchFish"))
        {
            hasFish = false;
            Destroy(currentFish);
            scoreDisplay.caughtFish = scoreDisplay.caughtFish + 1; 
            source.PlayOneShot(audio1);  
        }

        if (other.gameObject.CompareTag("penguinTriggerAbove"))
        {
            spriteRenderer.sprite = newSprite;
            spriteRenderer2.sprite = newSpriteWorm;   
        }

        if (other.gameObject.CompareTag("penguinTrigger"))
        {
            spriteRenderer.sprite = newSprite2;   
            spriteRenderer2.sprite = newSpriteWorm2; 
        }

        if(hasFish == true && other.gameObject.CompareTag("Barrel"))
        {
            Destroy(currentFish);
            GameObject brokenFish = Instantiate(fishBreak, transform.position + new Vector3(0,-100f,0), Quaternion.Euler(0,0,0));
            Destroy(brokenFish, 1);
            spriteRenderer2.sprite = newSpriteWorm2;
            hasFish = false;
            source.PlayOneShot(audio2);  
        }

        if(other.gameObject.CompareTag("Jellyfish"))
        {
            Destroy(currentFish);
            GameObject brokenFish = Instantiate(fishBreak, transform.position + new Vector3(0,-100f,0), Quaternion.Euler(0,0,0));
            Destroy(brokenFish, 1);
            spriteRenderer2.sprite = newSpriteWorm4;
            hasFish = false;
            worms = worms - 1;
            source.PlayOneShot(audio3);  
        }

        if(worms == 0)
        {
            
        }
      
    }
}
    
 

 
 
        
