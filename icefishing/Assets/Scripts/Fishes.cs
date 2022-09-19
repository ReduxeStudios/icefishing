using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Fishes : MonoBehaviour
{
   public GameObject[] newFish;

   public void SpawnNewFish()
   {
       StartCoroutine(SpawnAfterTime());
   }

   IEnumerator SpawnAfterTime()
   {
      yield return new WaitForSeconds(2);
      GameObject nb = Instantiate(newFish[Random.Range(0, newFish.Length)], this.transform) as GameObject;
      nb.transform.localPosition = new Vector3(Random.Range(-2f, 2f), 0.08f, 0);
   }
}
