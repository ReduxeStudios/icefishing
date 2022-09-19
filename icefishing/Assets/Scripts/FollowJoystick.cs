using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class FollowJoystick : MonoBehaviour
{
    // Start is called before the first frame update
    public Joystick joystick;
    float verticalMove = 0f;
    public float moveSpeed;
    public GameObject worm;
    private Rigidbody2D rb;

    

    void Start()
    {
        rb = GetComponent<Rigidbody2D>();
        moveSpeed = 10f;
    }

   

 
    void Update()
        {

            

            if(joystick.Vertical >= .2f)
            {
                rb.velocity = Vector2.up * moveSpeed;
                Debug.Log("Up");
            }
            else if (joystick.Vertical <= -.2f)
            {
                rb.velocity = Vector2.up * -moveSpeed;
                Debug.Log("Down");
            }
            else if (joystick.Vertical == 0f)
            {
                rb.velocity = Vector2.zero;
            }
            else if (worm.transform.position.y > 3.95)
            {
                rb.velocity = Vector2.zero;
            }
        
        }
   
}
