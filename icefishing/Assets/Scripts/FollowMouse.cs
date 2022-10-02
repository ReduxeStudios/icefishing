using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class FollowMouse : MonoBehaviour
{
    // Start is called before the first frame update
    float xAxis;
    float yOffset;
    public float moveSpeed;
    public GameObject worm;
    

    void Start()
    {
        xAxis = transform.position.x;
        yOffset = transform.localPosition.y;
        moveSpeed = 10f;
        worm = GameObject.Find("Worm");
    }

    Vector3 mousePosition;
    void Update()
        {
        mousePosition = Camera.main.ScreenToWorldPoint(Input.mousePosition);
        worm.transform.position = new Vector3(xAxis, mousePosition.y*1f + yOffset, 1f);
        if (worm.transform.position.y >= 3.95f)
            {
            Vector3 newPosition = new Vector3(xAxis, 3.95f, 1f);
            worm.transform.position = newPosition;

            }
        if (worm.transform.position.y <= -5f)
            {
            Vector3 newPosition = new Vector3(xAxis, -5f, 1f);
            worm.transform.position = newPosition;
            }
        
        
        }
   
   
}
