using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;

public class MenuScene : MonoBehaviour
{
    private CanvasGroup fadeGroup;
    private float fadeInSpeed = 0.33f;

    private void Start()
    {
        // Grab the CanvasGroup in the scene
        fadeGroup = FindObjectOfType<CanvasGroup>();

        // Start with a white screen
        fadeGroup.alpha = 1;
    }

    private void Update()
    {
        // Fade-In
        fadeGroup.alpha = 1 - Time.timeSinceLevelLoad * fadeInSpeed;
    }

    public void OnPlayClick()
    {
        Debug.Log("Play Button clicked");
        SceneManager.LoadScene("SampleScene");
    }

    public void OnSettingClick()
    {
        Debug.Log("Setting Button clicked");
    }
}
