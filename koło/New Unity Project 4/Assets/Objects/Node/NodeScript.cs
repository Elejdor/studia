using UnityEngine;
using System.Collections;

public class NodeScript : MonoBehaviour {

	public GameObject GameController;
	public bool used = false;
	GameControllerScript gameControllerScript;
	// Use this for initialization
	void Start () {

	}
	
	// Update is called once per frame
	void Update () {
	
	}

	void OnMouseOver()
	{

		if (!used && Input.GetMouseButton(0))
		{
			(GameController.GetComponent("GameControllerScript") as GameControllerScript).AddNode(this.gameObject);
			used = true;
		}
	}
}
