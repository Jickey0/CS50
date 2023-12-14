using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;

public class Despawn : MonoBehaviour {

	public GameObject characterController;

	// Use this for initialization
	void Start () {

	}
	
	// Update is called once per frame
	void Update () {
		if (characterController.transform.position.y < -5) {
			//Destroy(gameObject);
			Destroy(DontDestroy.instance.gameObject);
			LevelGenerator.levelTotal = 0;
			SceneManager.LoadScene("Death");
		}
	}
}
