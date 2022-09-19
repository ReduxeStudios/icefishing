using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class FollowMouse : MonoBehaviour
{
    // Start is called before the first frame update
    float xAxis;
    float yOffset;
    

    void Start()
    {
        xAxis = transform.position.x;
        yOffset = transform.localPosition.y;
    }

    Vector3 mousePosition;
    void Update()
        {
        mousePosition = Camera.main.ScreenToWorldPoint(Input.mousePosition);
        if (mousePosition.y > 3.95f)
            {
            mousePosition.y = 3.95f;
            }
        transform.position = new Vector3(xAxis, mousePosition.y*1f + yOffset, 1f);
        
        }
   
   
}
