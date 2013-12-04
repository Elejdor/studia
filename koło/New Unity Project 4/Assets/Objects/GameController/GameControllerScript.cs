using UnityEngine;
using System.Collections;
using System.Collections.Generic;

public class GameControllerScript : MonoBehaviour {


	public List<GameObject> SelectedNodes;
	public List<GameObject> Lines;

	public GameObject LineReference;


	// Use this for initialization
	void Start () {

	}
	
	// Update is called once per frame
	void Update () {
		if (Input.GetMouseButtonUp(0))
		{
			foreach(GameObject element in Lines)
			{
				Destroy(element);
			}
			Lines.Clear();

			foreach(GameObject element in SelectedNodes)
			{
				element.GetComponent<NodeScript>().used = false;
			}
			SelectedNodes.Clear();
		}
	}

	public void AddNode(GameObject node)
	{
		SelectedNodes.Add(node);
		AddLine(node);
	}
	
	void AddLine(GameObject node)
	{

		if (SelectedNodes.Count >= 2)
		{
			GameObject tmpLine = GameObject.Instantiate(LineReference) as GameObject;
			LineRenderer tmpRenderer = tmpLine.GetComponent<LineRenderer>();
			
			tmpRenderer.SetPosition(0, SelectedNodes[SelectedNodes.Count-2].transform.position);
			tmpRenderer.SetPosition(1, SelectedNodes[SelectedNodes.Count-1].transform.position);
			Lines.Add(tmpLine);
		}
		else if (SelectedNodes.Count == 1)
		{
			GameObject tmpLine = GameObject.Instantiate(LineReference) as GameObject;
			LineRenderer tmpRenderer = tmpLine.GetComponent<LineRenderer>();
			
			tmpRenderer.SetPosition(0, SelectedNodes[0].transform.position);
			tmpRenderer.SetPosition(1, new Vector3(Input.mousePosition.x, Input.mousePosition.y, 0));
			Lines.Add(tmpLine);
		}
	}
}