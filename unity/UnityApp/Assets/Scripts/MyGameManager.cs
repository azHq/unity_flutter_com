using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class MyGameManager : MonoBehaviour
{
    public static MyGameManager Instance;
    public Transform obstacleSource;
    public Transform obstaclePrefab;
    public int numberOfObstacle;
    public Vector2 spawnRange = new Vector2(-5.76f, 5.76f);
    private List<Transform> obstacles = new List<Transform>();

    private void Awake()
    {
        if (Instance==null)
        {
            Instance = this;
        }
    }
    void Start()
    {
        StartCoroutine(Initialize());
    }

    
    private void OnDestroy()
    {
        for (int i = 0; i < obstacles.Count; i++)
        {
          Destroy(obstacles[i]);
        }
        
    }
    IEnumerator Initialize()
    {
        for (int i = 0; i < numberOfObstacle; i++)
        {
            Transform obj = Instantiate(obstaclePrefab, obstacleSource,true);
            obj.position= new Vector3(Random.Range(spawnRange.x, spawnRange.y), obstacleSource.position.y, obstacleSource.position.z);
            obstacles.Add(obj);
            yield return new WaitForSeconds(Random.Range(.4f,.9f)); 
        }
    }
}
