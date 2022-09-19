using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class OceanTrigger : MonoBehaviour
{

    public wormFish wormFish;


    private void OnTriggerEnter2D(Collider2D other)
    {
        wormFish.hasFish = false;
    }


}