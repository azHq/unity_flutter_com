using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class FootBallController : MonoBehaviour
{
    public float speed = 1;
    private Rigidbody rb;
    void Start()
    {
        rb = GetComponent<Rigidbody>();
    }

    // Update is called once per frame
    void Update()
    {
        if(Input.GetKeyDown(KeyCode.LeftArrow))
        {
            Left();
        }
        else if(Input.GetKeyDown(KeyCode.RightArrow))
        {
            Right();
        }
        else if (Input.GetKeyDown(KeyCode.UpArrow))
        {
            Forward();
        }
    }
    public void Left()
    {
        rb.velocity = new Vector3(-speed, 0, 0);
        //rb.AddForce(new Vector3(-speed, 0, 0));
    }
    public void Right()
    {
        rb.velocity = new Vector3(speed, 0, 0);
    }
    public void Forward()
    {
        rb.velocity = new Vector3(0, 0, speed);
    }
}
