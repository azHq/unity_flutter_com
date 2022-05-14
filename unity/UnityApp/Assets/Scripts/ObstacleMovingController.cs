using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ObstacleMovingController : MonoBehaviour
{
    public float speed = 1f;
    // Update is called once per frame
    void Update()
    {
        transform.position+=new Vector3(0,0,-speed) ;
    }
    private void OnCollisionEnter(Collision collision)
    {
        Debug.Log(collision.transform.tag);
       //if(collision.transform.tag=="destroy") ResetPosition();
    }
    private void ResetPosition()
    {
        transform.position = new Vector3(Random.Range(MyGameManager.Instance.spawnRange.x, MyGameManager.Instance.spawnRange.y),MyGameManager.Instance.obstacleSource.position.y, MyGameManager.Instance.obstacleSource.position.z);
    }
    private void OnTriggerEnter(Collider other)
    {
        if (other.transform.tag == "destroy") ResetPosition();
    }
}

