using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Boundaries : MonoBehaviour
{
    private Vector2 screenBounds;
    Vector3 mousePosition;
    float xAxis;
    float yOffset;
    // Start is called before the first frame update
    void Start()
    {
        screenBounds = Camera.main.ScreenToWorldPoint(new Vector3(Screen.width, Screen.height, Camera.main.transform.position.z));
        xAxis = transform.position.x;
        yOffset = transform.localPosition.y;
    }

    // Update is called once per frame
    void LateUpdate()
    {
        Vector3 viewPos = transform.position;
        viewPos.y = Mathf.Clamp(viewPos.y, screenBounds.y, screenBounds.y * -1);
        
    }
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
