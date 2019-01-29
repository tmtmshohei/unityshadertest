using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UniRx;
using System;

//シェーダーとオブジェクトの橋渡しをする
public class SciFiExplosion : MonoBehaviour
{
    [SerializeField]
    private MeshRenderer meshRenderer;

    private Material material;

    private float  time;
    
    // Start is called before the first frame update

    private float passedtime;    

    public  void Update()
    {
        passedtime += Time.deltaTime;
    }
    public void Init(Color color, float size , float speed)
    {
        //マテリアルの取得
        material = meshRenderer.material;
        time= Time.timeSinceLevelLoad;

        //シェーダーに伝える
        //material.hogehoge 
        material.SetFloat("_PassedTime",time);
        material.SetFloat("_Speed",speed);
        //material.SetColor("_TintColor",color);
        Debug.Log("ScifiExplosion Color = " + color + "  size = " + size+ "speed" + speed);


        float delayTime = 0.7f;
        Observable.Return(0)
        .Delay(TimeSpan.FromSeconds(delayTime))
        .Subscribe(_ =>
        {
            //DelayTime後にやりたいこと
            //Destroyとか
            Destroy(gameObject);

        }).AddTo(this);
    }
}
