using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ObjectSpawner : MonoBehaviour
{
    public GameObject[] enemies;
    public Vector3 spawnValues;
    public float spawnWait;
    public float spawnMostWait;
    public float spawnLeastWait;
    public int startWait;
    public bool stop;
    public Vector2 spawnHeight;

    int randEnemy;
    
    public void Start()
    {
        StartCoroutine(waitSpawner());
    }

    // Start is called before the first frame update
    void Update ()
    {
       spawnWait = Random.Range (spawnLeastWait, spawnMostWait);
    }

    IEnumerator waitSpawner()
    {
        yield return new WaitForSeconds (startWait);

        while (!stop)
        {
            randEnemy = Random.Range (0, 4);

            Vector3 spawnPosition = new Vector3 (1, Random.Range (spawnHeight.x, spawnHeight.y), 1);

            GameObject objectGo = Instantiate (enemies[randEnemy], spawnPosition + transform.TransformPoint (0, 0, 0), gameObject.transform.rotation);
            Destroy(objectGo, 8);

            yield return new WaitForSeconds (spawnWait);
        }
    }

}

  
