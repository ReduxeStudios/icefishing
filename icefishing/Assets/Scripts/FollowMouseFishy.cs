using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class FollowMouseFishy : MonoBehaviour
{
    // Start is called before the first frame update
    float xAxis;
    float yOffset;
    float xOffset;
    public GameObject worm;
    

    void Start()
    {
        xAxis = transform.position.x;
        yOffset = transform.localPosition.y;
        xOffset = transform.localPosition.x;
        worm = GameObject.FindGameObjectWithTag("Worm");

    }

    
    void Update()
        {
        transform.position = new Vector3(xAxis + xOffset, worm.transform.position.y*1f + yOffset, 1f);
        }
   
   
}
