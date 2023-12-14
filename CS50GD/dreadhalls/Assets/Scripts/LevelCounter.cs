using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;
using UnityEngine.UI;

[RequireComponent(typeof(Text))]
public class LevelCounter : MonoBehaviour {

	// Create a temporary reference to the current scene.
	//Scene currentScene = SceneManager.GetActiveScene();

	// Retrieve the name of this scene.
	//string sceneName = currentScene.name;

	private Text text;
	private int level;

	// Use this for initialization
	void Start () {
		text = GetComponent<Text>();
	}

	// Update is called once per frame
	void Update () {
		if ("Play" == "Play") {
			level = LevelGenerator.levelTotal;
		}
		text.text = "Level: " + level;
	}
}

