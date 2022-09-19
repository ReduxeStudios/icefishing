using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using TMPro;

public class scoreDisplay : MonoBehaviour
{
    public int caughtFish;
    public wormFish wormFish;
    public TMPro.TextMeshProUGUI scoreText;

    void Start()
    {
        int caughtFish = 0;
        
    }

    void Update()
    {
        scoreText.text = caughtFish.ToString();
    }
            
}
